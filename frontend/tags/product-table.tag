<product-table>
  <br/>
  <h3>{ props.title }</h3>
  <br/>
  <div  class="float-right">
    <form onsubmit={ add }>
    <input onkeyup={ edit } />
    <button class="mx-2 btn btn-sm btn-outline-primary">Search</button>
  </form>
  </div>
  <table class="my-3 table table-striped table-bordered table-hover table-condensed">
    <thead>
      <tr>
        <th>Title</th>
        <th>Price</th>
        <th>Quanity</th>
        <th>More</th>
      </tr>
    </thead>
    <tbody>
      <tr each={item in props.items}>
        <td>{ item.title }</td>
        <td>{ item.price }</td>
      </tr>
    </tbody>
  </table>
</product-table>