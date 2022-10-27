import { reactive } from "vue";
const baseURL = "http://localhost:4000/api/users";

export const user = reactive({
  current: localStorage.getItem("user").id
    ? JSON.parse(localStorage.getItem("user"))
    : {},
  isSetted: localStorage.getItem("user")?.id ? true : false,
  notify: "",
  update(value) {
    if (value.id) {
      this.current = value;
      this.isSetted = true;
    }
  },
  async select(email, username) {
    console.log("select");
    const url = `${baseURL}?email=${email}&username=${username}`;
    const res = await fetch(url);

    if (!res.ok) {
      return "Network issue";
    }

    const data = await res.json();
    const args = data.data[0];
    if (!args.id) {
      return "User Not Found";
    }
    localStorage.setItem("user", JSON.stringify(args));
    this.current = args;
    this.isSetted = true;
    return "User Found";
  },
  async create(email, username) {
    const res = await fetch(baseURL, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        user: {
          email,
          username,
        },
      }),
    });
    if (!res.ok) {
      return "Network issue";
    }
    const data = await res.json();
    const args = data.data;
    localStorage.setItem("user", JSON.stringify(args));
    this.current = args;
    this.isSetted = true;

    return "User Created";
  },
  async delete() {
    if (!this.isSetted) {
      return "User not Setted";
    }
    const url = `${baseURL}/${this.current.id}`;
    const res = await fetch(url, {
      method: "DELETE",
    });
    if (!res.ok) {
      return "Network issue";
    }
    await this.empty();
    return "User Deleted";
  },
  async empty() {
    localStorage.setItem("user", JSON.stringify({}));
    this.isSetted = false;
    this.current = {};
  },
});
