let order = JSON.parse(localStorage.getItem("order")) || [];

const setInitialOrder = (() => {
  if(order.length){
    $(".indicator-item").text(order.length).removeClass("hidden");
    order.forEach(item => {
      $(`#${item.slug}`).addClass("bg-emerald-400 rounded-md");
      $(`#${item.slug}-remove-btn`).removeClass("hidden");
      $(`#${item.slug}-add-btn-grp`).addClass("hidden");
    })
  }
})();


const updatePrice = (event, itemSlug, itemPrice, maxQuantity, opNumber) => {
  const priceEle = $(`#${itemSlug}-price`);
  const price = parseFloat(itemPrice);

  let quantity;
  if (event) {
    quantity = parseInt(event.target.value);
  } else {
    const quantityEle = $(`#${itemSlug}-quantity`);
    const value = parseInt(quantityEle.val());
    if (value >= 1 && value <= parseInt(maxQuantity)) {
      if (value === 1 && opNumber === -1) return;
      if (value === parseInt(maxQuantity) && opNumber === 1) return;
      quantityEle.val(parseInt(value) + opNumber);
      quantity = parseInt(quantityEle.val());
    }else {
      quantityEle.val(1);
      quantity = 1;
    }
  }
  priceEle.text(price * quantity);
};

const addItem = (itemSlug, itemName) => {
  const isExist = order.find((item) => item.slug === itemSlug);
  if (!isExist) {
    const itemTotal = $(`#${itemSlug}-price`).text();
    const itemQuantity = $(`#${itemSlug}-quantity`).val();
    order.push({
      slug: itemSlug,
      name: itemName,
      quantity: itemQuantity,
      price: itemTotal,
    });
    localStorage.setItem("order", JSON.stringify(order));
    if($(`#${itemSlug}`)) $(`#${itemSlug}`).addClass("bg-emerald-400 rounded-md");
    $(`#${itemSlug}-remove-btn`).removeClass("hidden");
    $(`#${itemSlug}-add-btn-grp`).addClass("hidden");
  }
  $(`.indicator-item`).text(order.length).removeClass("hidden");
};

const removeItem = (itemSlug) => {
  order = order.filter((item) => item.slug !== itemSlug);
  localStorage.setItem("order", JSON.stringify(order));
  if($(`#${itemSlug}`)) $(`#${itemSlug}`).removeClass("bg-emerald-400 rounded-md");
  $(`#${itemSlug}-remove-btn`).addClass("hidden");
  $(`#${itemSlug}-add-btn-grp`).removeClass("hidden");
  if (order.length > 0) {
    $(`.indicator-item`).text(order.length).removeClass("hidden");
  } else {
    $(`.indicator-item`).addClass("hidden");
  }
};

const displayOrders = () => {
  const orderNo = Math.floor(Math.random()*(999-100+1)+100);
  $("#order-no-modal").text(orderNo);
  const ordersListEle = $(`#orders-list`);
  if (order.length > 0) {
    // adding table number input ⬇️
    let list = `
        <div class="form-control w-full mb-4">
            <input
                id="table-no"
                name="table_no"
                type="number"
                placeholder="Select table no. (only from 1-10)"
                min="1"
                max="10"
                class="input input-bordered w-full"
                required
            />
        </div>
    `;
    // adding order list ⬇️
    list += `
            <div class="overflow-x-auto">
            <table class="table w-full">
              <thead>
                <tr>
                  <th>Item</th>
                  <th>Quantity</th>
                  <th>Price</th>
                </tr>
              </thead>
              <tbody>
        `;
    order.forEach((item) => {
      list += `
                <tr>
                  <td>${item.name}</td>
                  <td>${item.quantity}</td>
                  <td>${item.price}</td>
                </tr>
            `;
    });
    // adding order total ⬇️
    const total = order.reduce(
      (acc, item) => parseFloat(acc) + parseFloat(item.price),
      0
    );
    list += `
                <tr>
                    <td></td>
                    <th>Your total is :</th>
                    <td>${total}</td>
                </tr>
            </tbody>
            </table>
        </div>
        `;
    ordersListEle.html(list);
    $("#confirm-order-btn").removeClass("hidden");
    $("#remove-all-btn").removeClass("hidden");
  } else {
    ordersListEle.html(
      `<p>You have no orders. Grab something from our menu.</p>`
    );
    $("#confirm-order-btn").addClass("hidden");
  }
};

const confirmOrder = (event, csrfmiddlewaretoken) => {
  event.preventDefault();
  const order_no = $("#order-no-modal").text();
  const table_no = $("#table-no").val();
    const finalOrder = {
      order_no,
      food_items: order,
      table_no,
      total_price: order.reduce((acc, item) => parseFloat(acc) + parseFloat(item.price), 0),
    }
    $.post("/order/", { data: JSON.stringify(finalOrder), csrfmiddlewaretoken }, (res) => {
        if(res["success"]){
          localStorage.setItem("order", JSON.stringify([]));
          window.location.href = `/check-order/${order_no}/${table_no}/`;
        }
    });
}

const removeAllItems = () => {
  order = [];
  localStorage.setItem("order", JSON.stringify(order));
  location.reload();
}
