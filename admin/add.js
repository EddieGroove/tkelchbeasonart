const submit = document.querySelector('#submit');


submit.addEventListener('click', () => {
// create html file and input info
    const title = document.querySelector('#title').value
    const docTitle = title.replace(/[^a-zA-Z0-9 ]|\s/g, '').toLowerCase();
    const doc = document.implementation.createHTMLDocument(docTitle);

    const style = doc.createElement('link');
    style.rel = 'stylesheet';
    style.href = '../css/pages.css';
    doc.head.appendChild(style);

    const div = doc.createElement('div');
    div.classList.add('border');

    const img = doc.createElement('img');
    // img.src =
    // img.height =
    div.appendChild(img);

    const size = document.querySelector('#picSize')
    const h1 = doc.createElement('h1');
    h1.innerHTML = title + ' ' + size.value;
    div.appendChild(h1);

    doc.body.appendChild(div);

    //now get it's contents and place into a blob
    const blob = new Blob([doc.documentElement.innerHTML], {
        type: 'text/html'
    });
    
    //now convert to url
    const docUrl = window.URL.createObjectURL(blob); 
    
    //were done, lets create a href to this and download
    const aclick = document.createElement('a');
    aclick.href = docUrl;
    aclick.download = docTitle;
    aclick.click();
    
    //tidy up
    window.URL.revokeObjectURL(docUrl);
    // newPage.fileSystemEntry.moveTo("~Tammy-Beason/pages");
    // newPage.moveTo("../pages");


});

