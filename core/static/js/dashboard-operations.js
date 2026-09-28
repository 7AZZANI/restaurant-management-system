$("#main-orders-checkbox").click(function() {
    $('input[name="orders-checkbox"]').prop('checked', this.checked);
})

const performAction = (csrfmiddlewaretoken) => {
    const orders = $("input[name='orders-checkbox']:checked").map(function() {
        return $(this).val();
    }).get();
    $.post("/order/action/", {
        csrfmiddlewaretoken,
        data: JSON.stringify({
            action: $("#action-for-orders").val(),
            orders,
        }),
    }, (res) => {
        if(res["success"]) {
            location.reload();
        }
    })
}