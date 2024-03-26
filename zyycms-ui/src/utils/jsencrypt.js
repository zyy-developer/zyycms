import JSEncrypt from 'jsencrypt/bin/jsencrypt.min'

// 密钥对生成 http://web.chacuo.net/netrsakeypair

// const publicKey = 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKoR8mX0rGKLqzcWmOzbfj64K8ZIgOdH\n' +
//   'nzkXSOVOZbFu/TJhZ7rFAN+eaGkl3C4buccQd/EjEsj9ir7ijT7h96MCAwEAAQ=='
//
//const privateKey = 'fFDIW5nNd7V8DuJsaaeRXa2M3oC9WL5AKCjQwQEXRNNNhdO28WE52Y/BfTYjjPz408P6EGtEhjL9FILUjN1lYThoHe1S1VBAbo6oIif2efqvSnFipSy/ad0hmbOezxrM6bkZlZaOyHVhqonT4MmGOzSsUNlexnUVfWCfzKrh7Kw='



// 加密
export function encrypt(txt,publicKey) {
  const encryptor = new JSEncrypt()
  encryptor.setPublicKey(publicKey) // 设置公钥
  return encryptor.encrypt(txt) // 对数据进行加密
}

// 解密
export function decrypt(txt) {
  const encryptor = new JSEncrypt()
  encryptor.setPrivateKey(privateKey) // 设置私钥
  return encryptor.decrypt(txt) // 对数据进行解密
}

