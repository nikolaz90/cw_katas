class ExcelIndex {
  constructor() {
    this.alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  }

  columnIndex(columnChars) {
    let finalIndex = 0;
    for (let i = 0; i < columnChars.length; i++) {
      let char = columnChars.at(-(i + 1));
      finalIndex += this.#encode26(char, i);
    }
    return finalIndex - 1;
  }

  //private

  #alphaIndex(char) {
    return (this.alphabet.indexOf(char) + 1);
  }

  #encode26(char, factor) {
    return this.#alphaIndex(char) * (26 ** factor)
  }
}

const excelIndexer = new ExcelIndex();
excelIndexer.columnIndex('ABC') // => 730
