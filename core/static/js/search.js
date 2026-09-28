jQuery.expr[":"].icontains = function (a, i, m) {
  return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};
// taking search element ref. so that highlighter can be erased
let ele;
const search = (event) => {
  if (event.target.value && event.target.value !== "") {
    if (ele) ele.removeClass("bg-amber-300");
    if (event.keyCode === 13) {
      ele = $(`*:icontains(${event.target.value}):last`);
      ele.addClass("bg-amber-300");
      $(window).scrollTop(ele.offset().top);
      event.target.value = "";
    }
  }
};

const searchOrder = () => {
  const orderNo = $("#order-no").val();
  const tableNo = $("#table-no").val();
  window.location.href = `/check-order/${orderNo}/${tableNo}/`;
};
