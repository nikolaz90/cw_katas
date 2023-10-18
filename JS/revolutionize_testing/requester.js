class Requester {
  constructor(url) {
    this.url = url;
  }

  async start () {
    let data = await this.#fetchData(this.url);
    this.#speak(data);
    while (this.#isFollowable(data)) {
      const newId = this.#getIdFromNewData(data)
      data = await this.#fetchData(`${this.url}${newId}`);
      this.#speak(data);
    }
  };

  // Private functions

  #speak(data) {
    const msg = data.message || 'nothing to report';
    console.log(msg);
  };

  async #fetchData(url) {
    let data = await fetch(url);
    let resp = await data.json();
    return resp;
  };

  #isFollowable (data) {
    return Object.keys(data).includes('follow') || false;
  };

  #getIdFromNewData(data) {
    const url = data.follow;
    const regex = /\?id=[0-9]{0,}$/;
    return url.match(regex)[0];
  };
}

export default Requester;
