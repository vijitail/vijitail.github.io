const notesContainer = document.getElementById('notesContainer')

const SERVER_URL = 'https://vijit-notes-api.herokuapp.com/notes'

const noteCard = note => /*html*/ `
    <div class='card'>
        <div class='card-body'>
            <h5 class="card-title">${note.title}</h5>
            <p class="card-text mt-2">${note.description}</p>
            <a href=${`/note.html?id=${note._id}&title=${encodeURI(
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

const getNotes = async () => {
    const response = await fetch(SERVER_URL)
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
    getNotes()
        .then(
            notes =>
                (notesContainer.innerHTML = `${notes.map(note =>
                    noteCard(note)
                )}`)
        )
        .catch(err => console.log(err.message))
}

const createNoteForm = document.forms['createNoteForm']

if (createNoteForm) {
    const titleInput = document.getElementById('title')
    const descriptionInput = document.getElementById('description')

    queryParams = new URL(document.location).searchParams

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
            window.location.href = '/'
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
        window.location.href = '/'
    }
}
