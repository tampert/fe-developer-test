<template>
  <v-app>
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="12">
            <div class="text-h4 text-center">My Dashboard</div>
          </v-col>
          <v-col cols="12">
            <div class="text-h6">Latest Posts</div>
          </v-col>
          <v-col cols="12">
            <v-row v-if="!loading.posts">
              <v-col v-for="post in posts" :key="post.id" cols="12" md="6">
                <v-card variant="outlined">
                  <v-card-title>{{ post.title }}</v-card-title>
                  <v-card-text class="text-truncate">{{
                    post.body
                  }}</v-card-text>
                </v-card>
              </v-col>
            </v-row>
            <v-row v-else>
              <v-col cols="12">
                <v-progress-linear indeterminate></v-progress-linear>
                <p>loading...</p>
              </v-col>
            </v-row>
            <v-row v-if="responseError.posts">
              <v-col cols="12">
                <v-alert type="error">{{ responseError.posts }}</v-alert>
                <v-btn @click="resetError('posts')">resetError</v-btn>
              </v-col>
            </v-row>
          </v-col>
          <v-col cols="12">
            <div class="text-h6">My Todo's</div>
          </v-col>
          <v-col cols="12">
            <v-select
              v-model="userId"
              :error="!!responseError.todos"
              :items="users"
              :loading="loading.todos"
              label="User id's"
            ></v-select>
          </v-col>
          <v-col cols="12">
            <v-row v-if="uniquePerUser.length > 0">
              <v-col
                v-for="todo in uniquePerUser"
                :key="todo.id"
                cols="12"
                md="6"
              >
                <v-card variant="outlined">
                  <v-card-text class="text-truncate">
                    <v-checkbox
                      :model-value="todo.status === 'completed' ? true : false"
                      :label="todo.title"
                      class="text-truncate"
                      readonly
                    ></v-checkbox>
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>
            <v-row v-else>
              <v-col v-if="!!responseError.todos" cols="12">
                <v-alert type="error">{{ responseError.todos }}</v-alert>
              </v-col>
              <v-col v-else cols="12">
                <p>Select a specific user id</p>
              </v-col>
            </v-row>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script setup>
import { ref, reactive, computed } from "vue";
const loading = reactive({});
const responseError = reactive({});
const posts = ref([]);
const todos = ref([]);
const userId = ref();

const getData = async (url, source, key) => {
  loading[key] = true;
  fetch(url, {
    headers: { "Content-type": "application/json" },
  })
    .then((res) => res.json())
    .then((response) => {
      source.value = response;
    })
    .catch((error) => {
      responseError[key] = ("Looks like there was a problem: \n", error);
    })
    .finally(() => (loading[key] = false));
};

getData("https://gorest.co.in/public/v2/posts", posts, "posts");
getData("https://gorest.co.in/public/v2/todos", todos, "todos");

const resetError = (key) => {
  responseError[key] = null;
};

const uniquePerUser = computed(() => {
  return todos.value.filter((todos) => todos.user_id == userId.value);
});

const users = computed(() => {
  return todos.value.map((todo) => todo.user_id);
});
</script>
