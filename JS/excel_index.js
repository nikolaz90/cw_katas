class ExcelIndex {
  constructor() {
    this.alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  }

  columnIndex(columnChars) {
    let finalIndex = 0;
    for (let i = 0; i < columnChars.length; i++) {
      let char = columnChars.at(-(i + 1));
      finalIndex += this.alphaIndex(char) * (26 ** i);
    }
    return finalIndex - 1;
  }

  alphaIndex(char) {
    return (this.alphabet.indexOf(char) + 1);
  }
}

const excelIndexer = new ExcelIndex();
excelIndexer.columnIndex('ABC') // => 730
