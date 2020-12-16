import { reactive } from 'vue';

export function useCountReactive() {
  const state = reactive({
    count: 0
  })
  return state
}