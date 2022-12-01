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
            <v-row>
              <v-col v-for="post in posts" :key="post.id" cols="12" md="3">
                <v-card variant="outlined">
                  <v-card-title>{{ post.title }}</v-card-title>
                  <v-card-text class="text-truncate">{{
                    post.body
                  }}</v-card-text>
                </v-card>
              </v-col>
            </v-row>
          </v-col>
          <v-col cols="12">
            <div class="text-h6">My Todo's</div>
          </v-col>
          <v-col cols="12">
            <v-select v-model="userId" :items="users" label="Users"></v-select>
          </v-col>
          <v-col cols="12">
            <v-row>
              <v-col
                v-for="todo in uniquePerUser"
                :key="todo.id"
                cols="12"
                md="3"
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
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script setup>
import { ref, computed } from "vue";
const checked = ref();
const posts = ref([]);
const todos = ref([]);
const userId = ref();

const getData = async (url, source) => {
  fetch(url, {
    headers: { "Content-type": "application/json" },
  })
    .then((res) => res.json())
    .then((response) => {
      source.value = response;
    })
    .catch((error) => {
      console.log("Looks like there was a problem: \n", error);
    });
};

getData("https://gorest.co.in/public/v2/posts", posts);
getData("https://gorest.co.in/public/v2/todos", todos);

const uniquePerUser = computed(() => {
  return todos.value.filter((todos) => todos.user_id == userId.value);
});

const users = computed(() => {
  return todos.value.map((todo) => todo.user_id);
});
</script>
