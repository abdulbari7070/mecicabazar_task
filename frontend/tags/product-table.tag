<product-table>
  <br/>
  <h3>{ props.title }</h3>
  <br/>
  <div class="row">
    <div class="col-8">
      <form onsubmit={ add }>
        <input onkeyup={ edit } />
        <button class="mx-2 btn btn-sm btn-outline-primary">Search</button>
      </form>
    </div>
    <div class="col-2 offset-2">
      <a href='#'
        class=" m-2 btn btn-sm btn-outline-success"
        data-bs-toggle="modal" data-bs-target="#AddProductModal">
        Add Product
      </a>
    </div>
    
  </div>
  <table class="my-3 table table-striped table-bordered table-hover table-condensed">
    <thead>
      <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Price</th>
        <th>Quanity</th>
        <th>More</th>
      </tr>
    </thead>
    <tbody>
      <tr each={item in state.items}>
        <td>{ item.id }</td>
        <td>{ item.name }</td>
        <td>{ item.price }</td>
        <td>{ item.quantity }</td>
        <td class="text-center">
          <a href='#'
              class=" m-2 btn btn-sm btn-outline-warning"
              data-bs-toggle="modal" data-bs-target="#UpdateProductModal">
              Edit
            </a>
            <a href='#'
            class="m-2 btn btn-sm btn-outline-danger"
            data-bs-toggle="modal" data-bs-target="#DeleteProductModal">
            Delete
          </a>
        </td>
      </tr>
    </tbody>
  </table>
  
  
  
  <div class="modal fade" id="UpdateProductModal" tabindex="-1" aria-labelledby="UpdateProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="UpdateProductModalLabel">Update Product</h3>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
    
      </div>
    </div>
  </div>


  <div class="modal fade" id="DeleteProductModal" tabindex="-1" aria-labelledby="DeleteProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="DeleteProductModalLabel">Delete Product</h3>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="AddProductModal" tabindex="-1" aria-labelledby="AddProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="AddProductModalLabel">Add New Product</h3>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
      </div>
    </div>
  </div>


  <script>
     export default {
      onBeforeMount(props, state) {
        // initial state
        this.state = {
          items: props.items,
        }
      }
    }
  </script>




</product-table>