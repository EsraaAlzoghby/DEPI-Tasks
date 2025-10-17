// Select Elements
const msgBox = document.getElementById("msgBox");
const productForm = document.getElementById("productForm");
const cancelBtn = document.getElementById("cancelBtn");
const tableBody = document.getElementById("tableBody");
const submitBtn = document.getElementById("submitBtn");

// State
let productList = JSON.parse(localStorage.getItem("productList")) || [];
let editId = null;

// Utility: Save to Local Storage
const saveProducts = () => {
  localStorage.setItem("productList", JSON.stringify(productList));
};

// Utility: Show Alert
function showMessage(text, type = "success") {
  msgBox.className = `alert alert-${type}`;
  msgBox.innerText = text;
  msgBox.style.display = "block";
  setTimeout(() => (msgBox.style.display = "none"), 2000);
}

// Utility: Read image
function readImage(file) {
  return new Promise((resolve, reject) => {
    if (!file) return resolve(null);
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = reject;
    reader.readAsDataURL(file);
  });
}

// Render Table
function renderTable() {
  if (productList.length === 0) {
    tableBody.innerHTML = `<tr><td colspan="8" class="text-center text-muted">No products yet.</td></tr>`;
    return;
  }

  tableBody.innerHTML = productList
    .map(
      (p, i) => `
      <tr>
        <td>${i + 1}</td>
        <td>${p.name}</td>
        <td>${p.price}</td>
        <td>${p.category}</td>
        <td>${p.description}</td>
        <td>${p.image ? `<img src="${p.image}" style="width:60px;height:40px;object-fit:cover;">` : ""}</td>
        <td>
          <button class="btn btn-outline-warning btn-sm" data-action="edit" data-id="${p.id}">
            <i class="fa-solid fa-pen"></i>
          </button>
        </td>
        <td>
          <button class="btn btn-outline-danger btn-sm" data-action="delete" data-id="${p.id}">
            <i class="fa-solid fa-trash"></i>
          </button>
        </td>
      </tr>
    `
    )
    .join("");
}

// Handle Table Click (Edit/Delete)
tableBody.addEventListener("click", (e) => {
  const btn = e.target.closest("button");
  if (!btn) return;
  const { action, id } = btn.dataset;
  if (action === "edit") handleEdit(id);
  if (action === "delete") handleDelete(id);
});

// Add or Update Product
productForm.addEventListener("submit", async (e) => {
  e.preventDefault();

  const name = document.getElementById("inputName").value.trim();
  const price = document.getElementById("inputPrice").value.trim();
  const category = document.getElementById("inputCategory").value;
  const description = document.getElementById("inputDesc").value.trim();
  const imageFile = document.getElementById("inputImage").files[0];
  const imageData = await readImage(imageFile);

  if (!name || !price) return showMessage("Please fill in all required fields", "danger");

  if (editId) {
    const product = productList.find((p) => p.id === editId);
    if (!product) return showMessage("Product not found", "danger");

    Object.assign(product, { name, price, category, description });
    if (imageData) product.image = imageData;

    showMessage("Product updated successfully!");
    editId = null;
    submitBtn.textContent = "Add Product";
    cancelBtn.style.display = "none";
  } else {
    productList.push({
      id: String(Date.now()),
      name,
      price,
      category,
      description,
      image: imageData || "",
    });
    showMessage("Product added successfully!");
  }

  saveProducts();
  renderTable();
  productForm.reset();
});

// Edit Product
function handleEdit(id) {
  const product = productList.find((p) => p.id === id);
  if (!product) return showMessage("Product not found", "danger");

  document.getElementById("inputName").value = product.name;
  document.getElementById("inputPrice").value = product.price;
  document.getElementById("inputCategory").value = product.category;
  document.getElementById("inputDesc").value = product.description;

  editId = id;
  submitBtn.textContent = "Save Changes";
  cancelBtn.style.display = "inline-block";
  productForm.scrollIntoView({ behavior: "smooth" });
}

// Cancel Edit
cancelBtn.addEventListener("click", () => {
  editId = null;
  productForm.reset();
  cancelBtn.style.display = "none";
  submitBtn.textContent = "Add Product";
});

// Delete Product
function handleDelete(id) {
  if (!confirm("Are you sure you want to delete this product?")) return;
  productList = productList.filter((p) => p.id !== id);
  saveProducts();
  renderTable();
  showMessage("Product deleted", "warning");
}

// Initial State
cancelBtn.style.display = "none";
renderTable();
