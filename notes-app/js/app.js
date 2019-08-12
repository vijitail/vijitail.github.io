const notesContainer = document.getElementById('notesContainer')

const SERVER_URL = 'https://vijit-notes-api.herokuapp.com/notes'

queryParams = new URL(document.location).searchParams

const noteCard = note => /*html*/ `
    <div class='card'>
        <div class='card-body'>
            <h5 class="card-title">${note.title}</h5>
            <p class="card-text mt-2">${note.description}</p>
            <a href=${`note.html?id=${note._id}&title=${encodeURI(
                note.title
            )}&description=${encodeURI(
                note.description
            )}`} rel="preload" class="btn btn-dark btn-sm mr-2">Edit Note</a>
            <button class="btn btn-danger btn-sm" onClick="deleteNote(event);" data-id=${
                note._id
            }>Delete Note</button>
        </div>
    </div>
`

const getNotes = async page => {
    const response = await fetch(SERVER_URL + '/?page=' + page)
    const data = await response.json()
    return data
}

// display the notes
if (notesContainer) {
    notesContainer.innerHTML = /*html*/ `<div class='card'>
    <div class='card-body'>
        <h5 class="card-title">Loading ...</h5>
    </div>
</div>`
    const page = queryParams.get('page') || '1'
    getNotes(page)
        .then(data => {
            const renderPaginationLinks = pages => {
                let html = /*html*/ `<ul class="pagination mt-4">`
                for (let i = 1; i <= pages; i++)
                    html += /*html*/ `<li class="page-item"><a class=${`page-link ${i ===
                        parseInt(page) &&
                        'active'}`} href=${`?page=${i}`}>${i}</a></li>`
                html += /*html*/ `</ul>`
                return html
            }

            return (notesContainer.innerHTML = `${
                data.notes.length !== 0
                    ? data.notes.map(note => noteCard(note))
                    : '<p>No notes have been created yet.</p>'
            } ${data.pages > 1 && renderPaginationLinks(data.pages)}`)
        })
        .catch(err => console.log(err.message))
}

const createNoteForm = document.forms['createNoteForm']

if (createNoteForm) {
    const titleInput = document.getElementById('title')
    const descriptionInput = document.getElementById('description')

    titleInput.value = queryParams.get('title')
    descriptionInput.value = queryParams.get('description')
    const noteId = queryParams.get('id')

    if (noteId) {
        document.getElementsByTagName('h1')[0].innerText = 'Edit Note'
    }

    titleInput.addEventListener('focus', e => {
        if (titleInput.classList.contains('is-invalid')) {
            titleInput.classList.remove('is-invalid')
            titleInput.nextElementSibling.innerHTML = ''
        }
    })

    createNoteForm.addEventListener('submit', async e => {
        e.preventDefault()
        const values = {
            title: titleInput.value,
            description: descriptionInput.value,
        }
        let method, URL
        URL = SERVER_URL
        if (noteId) {
            method = 'PUT'
            URL = `${SERVER_URL}/${noteId}`
        } else {
            method = 'POST'
        }
        const response = await fetch(URL, {
            method,
            headers: {
                Accept: 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(values),
        })
        const data = await response.json()
        if (data.errors) {
            const { title, description } = data.errors
            if (title) {
                titleInput.classList.add('is-invalid')
                titleInput.nextElementSibling.innerHTML = data.errors.title
            }
            if (description) {
                descriptionInput.classList.add('is-invalid')
                descriptionInput.nextElementSibling.innerHTML =
                    data.errors.description
            }
        } else {
            window.history.back()
        }
    })
}

const deleteNote = async e => {
    const URL = `${SERVER_URL}/${e.target.dataset.id}`
    const response = await fetch(URL, {
        method: 'DELETE',
    })
    const data = await response.json()
    if (data) {
        window.location.reload()
    }
}
