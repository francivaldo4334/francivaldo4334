const prevButton = document.getElementById('prev-btn');
const nextButton = document.getElementById('next-btn');
const listImageContainer = document.getElementById('image-list');
let currentPage = 1;
let totalPages = 0;
let maxItenPage = 6;
const readmeUrl = 'https://raw.githubusercontent.com/francivaldo4334/francivaldo4334/main/README.md';
function getListByPage(page){
    if(window.innerWidth < 769){
        maxItenPage = 30
    }
    else{
        maxItenPage = 6
    }
    var rote = 'https://api.github.com/users/francivaldo4334/repos?type=public&sort=updated&per_page='+maxItenPage+'&page='+page
    fetch(rote)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao obter os repositórios do usuário');
            }
            return response.json();
        })
        .then(data => {
            listImageContainer.innerHTML = ''
            data.forEach(repo => {
                var url = 'https://github-readme-stats.vercel.app/api/pin/?username=francivaldo4334&repo='+repo.name;
                const itemImg = document.createElement('li');
                itemImg.classList.add('image-item');
                const a = document.createElement('a');
                const img = document.createElement('img');
                img.src = url;
                if(repo.homepage != null)
                    a.href = repo.homepage
                else
                    a.href = repo.html_url;
                a.target = "_blank";
                a.appendChild(img)
                itemImg.appendChild(a);
                listImageContainer.appendChild(itemImg);
            });
        })
        .catch(error => console.error('Erro:', error));
}
function loadTotalPage(){
    if(window.innerWidth < 769){
        maxItenPage = 10
    }
    else{
        maxItenPage = 6
    }
    document.addEventListener('DOMContentLoaded', function(){
        fetch('https://api.github.com/users/francivaldo4334')
            .then(response =>{
                if(!response.ok){
                    return new Error('Erro get total page')
                }
                return response.json();
            })
            .then(data =>{
                totalPages = data.public_repos/maxItenPage
            })
    })
}
function setupPagination() {
    prevButton.addEventListener('click', () => {
      if (currentPage > 1) {
        currentPage--;
        getListByPage(currentPage);
      }
      console.log(currentPage);
    });
  
    nextButton.addEventListener('click', () => {
        if (currentPage < totalPages) {
            currentPage++;
            getListByPage(currentPage);
        }
        console.log(currentPage);
    });
}
async function fetchAndRenderReadme() {
    if(window.innerWidth > 769){
        try {
            const response = await fetch(readmeUrl);
            const readmeText = await response.text();
            const converter = new showdown.Converter();
            const html = converter.makeHtml(readmeText);
            document.getElementById('readme-content').innerHTML = html;
        } catch (error) {
            console.error('Erro ao buscar o README:', error);
        }
    }
}
fetchAndRenderReadme();
loadTotalPage()
getListByPage(1)
setupPagination()