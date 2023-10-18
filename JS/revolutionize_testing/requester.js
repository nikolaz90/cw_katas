class Requester {
  constructor(url) {
    this.url = url;
  }

  start () {
    let data = this.#fetchData(this.url)
    this.#speak(data)
  };

  #speak(data) {
    console.log(data);
  };

  #fetchData(url) {
    let data = {};
    fetch(url).then(r => r.json())
              .then(d => data = d)
              .catch(e => console.log(e))
  };
}

export default Requester;
