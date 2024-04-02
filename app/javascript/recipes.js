document.addEventListener('turbo:load', () => {
  const addButton = document.getElementById('add_ingredient');
  if (addButton) {
    addButton.addEventListener('click', function(e) {
      e.preventDefault();
      console.log('Add ingredient button was clicked');

      // 新しい材料入力行を作成
      const newRow = document.createElement('tr');
      const currentTime = new Date().getTime();
      const index = currentTime;

      newRow.innerHTML = `
        <td><input type="text" name="recipe[ingredients_attributes][${index}][name]" placeholder="材料名"></td>
        <td><input type="text" name="recipe[ingredients_attributes][${index}][quantity]" placeholder="分量"></td>
        <td><a href="#" class="remove_fields">削除</a></td>
      `;

      console.log(`Adding new ingredient field with index: ${index}`);


      // 新しい行に削除リンクのイベントリスナーを設定
      const removeLink = newRow.querySelector('.remove_fields');
      removeLink.addEventListener('click', function(e) {
        e.preventDefault();
        newRow.remove();
      });

      document.getElementById('ingredients_table').querySelector('tbody').appendChild(newRow);
      console.log(document.getElementById('ingredients_table').innerHTML);
    });
  }
});
