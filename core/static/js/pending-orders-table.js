const updatePendingOrdersTable = (orders) => {
    tbody = $('#pending-orders-table tbody');
    let rows = "";
    orders.forEach(order => {
        rows += `
            <tr>
                <th>
                    <input name="orders-checkbox" type="checkbox" class="checkbox checkbox-xs" value="${order.id}" />
                </th>
                <td>${order.order_no}</td>
                <td>${order.table_no}</td>
                <td>${order.date}</td>
                <td>
                    ${order.food_items}
                </td>
                <td>${order.total_price}</td>
            </tr>
        `
    });
    tbody.html(rows);
}