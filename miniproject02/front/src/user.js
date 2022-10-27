import { reactive } from "vue";
const baseURL = "http://localhost:4000/api/users?";

export const user = reactive({
  current: {},
  isSetted: false,
  notify: "",
  update(value) {
    if (value.id) {
      this.current = value;
      this.isSetted = true;
    }
  },
  async select(email, username) {
    console.log("select");
    const url = `${baseURL}email=${email}&username=${username}`;
    const res = await fetch(url);

    if (!res.ok) {
      return "Network issue";
    }

    const data = await res.json();
    const args = data.data[0];
    if (!args.id) {
      return "User Not Found";
    }

    this.current = args;
    return "User Found";
  },
});
