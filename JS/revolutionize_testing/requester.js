class Requester {
  constructor(url) {
    this.url = url;
  }

  async start () {
    let data = await this.#fetchData(this.url)
    this.#speak(data);
    this.#isFollowable(data);
  };

  #speak(data) {
    console.log(data.message);
  };

  async #fetchData(url) {
    let data = await fetch(url)
    let resp = await data.json()

    return resp
  };

  #isFollowable (data) {
    return Object.keys(data).includes('follow') || false;
  };
}

export default Requester;
