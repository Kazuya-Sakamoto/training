<script lang="ts">
import { defineComponent, reactive, toRefs } from 'vue';

const initialState = () => ({
  is_mute: true,
  video: false
});

export default defineComponent({
  name: 'Movie',
  components: {},

  setup() {
    const state = reactive(initialState())

    return {
      ...toRefs(state),
    }
  }
});
</script>

<template>
  <section>
    <div class="movie-card">
      <!-- AAC、H.264 -->
      <video src="../assets/movies/a.mp4" controls />
    </div>
    <div class="movie-card">
      <!-- AAC、HEVC -->
      <video src="../assets/movies/H.264.mp4" controls />
    </div>
    <div class="movie-card">
      <!-- AAC、HEVC -->
      <video src="../assets/movies/b.mp4" controls />
    </div>
  </section>
</template>


<style lang="scss" scoped>
section {
  .movie-card {
    video {
      width: 400px;
      height: 150px;
    }
  }
}
</style>
