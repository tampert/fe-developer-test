# todo-vue3

## Project setup

```
# npm
npm install
```

### Compiles and hot-reloads for development

```
# npm
npm run dev
```

visit: http://localhost:8080/

### Compiles and minifies for production

```
# npm
npm run build

```

### Environement

- JS-framework Vue3
- CSS-Framework Vuetify3
- UI-Kit Vuetify3
- Docker

### Features

- Add loading
- Add error messaging
- Add v-select to select an unique user_id

### Feedback

There is a lot of room for interpretation with the given wireframe. I have a lot of questions about this wireframe. I think it is important for a developer to stay within the scope of the assignment. Some of the questions popped up.

- Should I build in routes? F.e. If you click on a post
- What happens if I toggle the checkbox for a certain user? I made it readonly
- Am I allowed to change the status of the specific user?
- What happens when the user reloads the page? Should the selected user_id be persistent?
- etc.

Since this is just a single-page dashboard I did not create any components.

I didn't need an access token for the API https://gorest.co.in the endpoints worked without the access token.

In my current role, I learned that I should leave as less room for assumptions as possible. So I stick to the wireframe and try to develop only what is asked.

For future assignments for applicants, I would suggest that you add some more specific information.

I have added a docker file. good to mention that hot reloading is not working for now.

future improvements: add typescript

### docker

dependency docker installed

```
cd into root dir /fe-developer-test


docker build -t vue3 .


docker run -p 8080:8080 -it IMAGE_ID

docker run -p 8080:8080 -it fca10bb8b642
```
