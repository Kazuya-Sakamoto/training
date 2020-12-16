<template>
  <div id="app">
    <div>
      <!-- Aパターン -->
      <h1>Aパターン</h1>
      <button @click="decrementA()">-</button>
      {{ state.count }}
      <button @click="incrementA()">+</button>
      <!-- Bパターン -->
      <h1>Bパターン</h1>
      <button @click="decrementB()">-</button>
      {{ count }}
      <button @click="incrementB()">+</button>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { useCountReactive } from '../state/CounteReactive'

export default defineComponent({
  setup() {
    //* Aパターン
    const state = useCountReactive()
    function incrementA() {
      state.count++
    }
    function decrementA() {
      state.count--
    }

    //* Bパターン (countそのものに変更を加えたい想定なので、letで定義しています)
    let { count } = useCountReactive()
    function incrementB() {
      count++
    }
    function decrementB() {
      count--
    }

    return {
      state,
      incrementA,
      decrementA,
      count,
      incrementB,
      decrementB
    }
  }
});
</script>