document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('add_ingredient').addEventListener('click', function(e) {
    e.preventDefault();

    // 新しい材料入力行を作成
    const newRow = document.createElement('tr');
    const currentTime = new Date().getTime();
    const index = currentTime;

    newRow.innerHTML = `
      <td><input type="text" name="recipe[ingredients_attributes][${index}][name]" placeholder="材料名"></td>
      <td><input type="text" name="recipe[ingredients_attributes][${index}][quantity]" placeholder="分量"></td>
      <td><a href="#" class="remove_fields" onclick="removeIngredientRow(this)">削除</a></td>
    `;

    document.getElementById('ingredients_table').querySelector('tbody').appendChild(newRow);
  });

  window.removeIngredientRow = function(link) {
    const row = link.parentNode.parentNode;
    row.parentNode.removeChild(row);
  }
});
