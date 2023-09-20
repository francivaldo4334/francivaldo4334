document.addEventListener('DOMContentLoaded', function() {
    const listImageContainer = document.getElementById('image-list');
    fetch('https://api.github.com/users/francivaldo4334/repos?type=public&sort=updated&per_page=10')
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao obter os repositórios do usuário');
            }
            return response.json();
        })
        .then(data => {
            data.forEach(repo => {
                var url = 'https://github-readme-stats.vercel.app/api/pin/?username=francivaldo4334&repo='+repo.name;
                const itemImg = document.createElement('li');
                itemImg.classList.add('image-item');
                const a = document.createElement('a');
                const img = document.createElement('img');
                img.src = url;
                a.href = repo.html_url;
                a.target = "_blank";
                a.appendChild(img)
                itemImg.appendChild(a);
                listImageContainer.appendChild(itemImg);
            });
        })
        .catch(error => console.error('Erro:', error));
  });