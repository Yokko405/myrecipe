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


  // レシピ削除ボタンのイベントリスナーを設定
  const deleteButton = document.querySelector('.delete-recipe');
  if (deleteButton) {
    deleteButton.addEventListener('click', function(e) {
      console.log('削除ボタンがクリックされました')
      e.preventDefault();
      if (confirm('本当に削除しますか？')) {
        const recipeId = this.dataset.recipeId;
        fetch(`/recipes/${recipeId}`, {
          method: 'DELETE',
          headers: {
            'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
          }
        }).then(response => {
          if (response.ok) {
            window.location.href = '/recipes'; // 削除後のリダイレクト
          } else {
            alert('レシピの削除に失敗しました。');
          }
        });
      }
    });
  }

  'レシピ画像のプレビュー'
  const inputElement = document.getElementById('image-preview');
  inputElement.addEventListener('change', function() {
    const previewContainer = document.getElementById('preview-container');
    let previewImage = document.getElementById('image-preview-tag');
    const file = inputElement.files[0];

    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        // previewImageが存在しなければ新しく作成
        if (!previewImage) {
          previewImage = document.createElement('img');
          previewImage.id = 'image-preview-tag';
          previewImage.style.maxWidth = '200px';
          previewContainer.appendChild(previewImage);
        }
        previewImage.src = e.target.result;
        previewImage.style.display = 'block';
      }
      reader.readAsDataURL(file);
    } else {
      if (previewImage) {
        previewImage.style.display = 'none';
      }
    }
  });
});
