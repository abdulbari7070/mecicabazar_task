<product-table>
  <br />
  <h3>{ props.title }</h3>
  <br />
  <div class="row">
    <div class="col-8">
      <form onsubmit={ search }>
        <input type="text" id="mySearch" onkeyup={ edit } />
        <button class="mx-2 btn btn-sm btn-outline-primary">Search</button>
      </form>
    </div>
    <div class="col-2 offset-2">
      <a href='#' class=" m-2 btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#AddProductModal">
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
          <a href='#' class=" m-2 btn btn-sm btn-outline-warning" data-bs-toggle="modal"
            data-bs-target="#UpdateProductModal"
            id="edit_button"
            >
            Edit
          </a>
          <!-- <a href='#' class="m-2 btn btn-sm btn-outline-danger" data-bs-toggle="modal"
            data-bs-target="#DeleteProductModal">
            Delete
          </a> -->
        </td>
      </tr>
    </tbody>
  </table>

  <div class="modal fade" id="UpdateProductModal" tabindex="-1" aria-labelledby="UpdateProductModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="UpdateProductModalLabel">Update Product</h3>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form onsubmit={ add_product }>
            <div class="form-group">
              <label for="product-id" class="col-form-label">Product Id : </label>
            </div>
            <div class="form-group">
              <label for="product-name" class="col-form-label">Product Name:</label>
              <input type="text" class="form-control" onkeyup={ edit_p_name } value={ state.p_name }>
            </div>
            <div class="form-group">
              <label for="recipient-name" class="col-form-label">Price:</label>
              <input type="number" class="form-control" onkeyup={ edit_p_price } value={ state.p_price }>
            </div>
            <div class="form-group">
              <label for="recipient-name" class="col-form-label">Quanity:</label>
              <input type="number" class="form-control" onkeyup={ edit_p_quantity } value={ state.p_quantity }>
            </div>
            <div class="mt-5 form-group">
              <input type="submit" class="btn btn-outline-primary form-control" id="update-form-submit">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>


  <!-- <div class="modal fade" id="DeleteProductModal" tabindex="-1" aria-labelledby="DeleteProductModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="DeleteProductModalLabel">Delete Product</h3>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
      </div>
    </div>
  </div> -->

  <div class="modal fade" id="AddProductModal" tabindex="-1" aria-labelledby="AddProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="AddProductModalLabel">Add New Product</h3>
          <button type="button" id="AddProductModalBtn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form onsubmit={ add_product }>
            <div class="form-group">
              <label for="product-name" class="col-form-label">Product Name:</label>
              <input type="text" class="form-control" onkeyup={ edit_p_name } value={ state.p_name }>
            </div>
            <div class="form-group">
              <label for="recipient-name" class="col-form-label">Price:</label>
              <input type="number" class="form-control" onkeyup={ edit_p_price } value={ state.p_price }>
            </div>
            <div class="form-group">
              <label for="recipient-name" class="col-form-label">Quanity:</label>
              <input type="number" class="form-control" onkeyup={ edit_p_quantity } value={ state.p_quantity }>
            </div>
            <div class="mt-5 form-group">
              <input type="submit" class="btn btn-outline-primary form-control" id="add-form-submit">
            </div>
        </div>
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
          p_name: '',
          p_price: '',
          p_quantity: '',
          edit_item : ''
        }
      },
      edit_p_name(e) {
        this.update({
          p_name: e.target.value
        })
      },
      edit_p_price(e) {
        this.update({
          p_price: e.target.value
        })
      },
      edit_p_quantity(e) {
        this.update({
          p_quantity: e.target.value
        })
      },
      add_product(e) {
        e.preventDefault()
        if (this.state.p_name && this.state.p_price && this.state.p_quantity) {
          const product = {
            "name": this.state.p_name,
            "quantity": parseInt(this.state.p_quantity),
            "price": parseFloat(this.state.p_price)
          }

          axios.post('http://127.0.0.1:8000/api/v1/products/', product)
            .then(response =>
              this.update({
                items: [
                  {
                    id: response.data.id,
                    name: response.data.name,
                    price: response.data.price,
                    quantity: response.data.quantity
                  },
                  ...this.state.items
                ],
                p_name: '',
                p_price: '',
                p_quantity: ''
              })
              
            )
            document.getElementById("AddProductModalBtn").click();
        }
      },
      search(e) {
        e.preventDefault()
        const value = document.getElementById('mySearch').value;
        axios.get('http://127.0.0.1:8000/api/v1/products', {params: {search: value}})
        .then((response) => {
          console.log(response.data);
        });

      }
    }
  </script>
</product-table>