<product-table>
<br/>
  <h3>{ state.title }</h3>
  <table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
      <tr>
        <th>Title</th>
        <th>Price</th>
      </tr>
    </thead>
    <tbody>
      <tr each={item in state.items}>
        <td>{ item.title }</td>
        <td>{ item.price }</td>
      </tr>
    </tbody>
  </table>
</product-table>