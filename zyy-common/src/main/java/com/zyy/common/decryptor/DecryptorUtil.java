package com.zyy.common.decryptor;
import org.apache.commons.codec.binary.Base64;
import javax.crypto.Cipher;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * RSA加密解密
 *
 * @author ruoyi
 **/
public class DecryptorUtil
{
    // Rsa 私钥
    public static String privateKey = "MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAqhHyZfSsYourNxaY"
            + "7Nt+PrgrxkiA50efORdI5U5lsW79MmFnusUA355oaSXcLhu5xxB38SMSyP2KvuKN"
            + "PuH3owIDAQABAkAfoiLyL+Z4lf4Myxk6xUDgLaWGximj20CUf+5BKKnlrK+Ed8gA"
            + "kM0HqoTt2UZwA5E2MzS4EI2gjfQhz5X28uqxAiEA3wNFxfrCZlSZHb0gn2zDpWow"
            + "cSxQAgiCstxGUoOqlW8CIQDDOerGKH5OmCJ4Z21v+F25WaHYPxCFMvwxpcw99Ecv"
            + "DQIgIdhDTIqD2jfYjPTY8Jj3EDGPbH2HHuffvflECt3Ek60CIQCFRlCkHpi7hthh"
            + "YhovyloRYsM+IS9h/0BzlEAuO0ktMQIgSPT3aFAgJYwKpqRYKlLDVcflZFCKY7u3"
            + "UP8iWi1Qw0Y=";

    public static String publicKey = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKoR8mX0rGKLqzcWmOzbfj64K8ZIgOdH\n" +
            "nzkXSOVOZbFu/TJhZ7rFAN+eaGkl3C4buccQd/EjEsj9ir7ijT7h96MCAwEAAQ==";

    public static String myPrivateKey ="MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAJxXj01tehMagxHBDEPQ84RCdeowpYx3iTo2AqF63qgNei1AWb3fNiNjC7tswfY5csU6B8AnI98Mqj0UkEDncAWpFLtM9eBFkw+keMSN47hvO7/sh3ilaoCPimoy7VDaIT597nS4k4zuKomRsjZ1Zp7gVIHnJYjetq35IcjBsOi/AgMBAAECgYAnWJvuiw5Nb38sAS8ihBw9HXLKiQqo4s6M8VnRJPiTR60HZWoQcHQSDNO/jBv2aTfargOUVuVetbPEYn/5baWRykjHFk/mNnos2AN83nTufgWusZNf9Rn2w2iEbCNNacwjXL43ZQm3UaX5LYDho1wGOeo7Hfz1gsocu65Yz2REAQJBANLgd4bdIU4lo6RB0LUphFnJsSnaWrzJQAcawW/ePDqmezKCJAKoxzT1aExSi8+wrKPeFek02gzVwu2UjbJsXL8CQQC9y8EZUGuciWDieoC94uyd5+JNtPhXALm5mG2vg58GSKpei0krzKPZtFxIgBSfbgrqetxE9txBJgys1vT0QnQBAkEA0aNVMD2lXosMo77KPU+Iw7o+5dytWAC6JlXy98N3HNdkolG+euZPI9bUWQu28kIxXrbqEWz5WMkpgAau1zHjAQJBAInpNV30js1HEcxfoY7ZBoBTD6DRYCawE0RmG0WOyY3iXVGnujqGT4UQxoGz98hFSM9LCSVfj3oTcOBircmTRAECQEDvsI4BFWtI2gWoddbch4YauRgBXB2i4TvAd/vGuZWBp18cD6SrgspVlDUF0prskER6vUo+/rEGRSwIEbtauwU=";
    public static String myPublicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCcV49NbXoTGoMRwQxD0POEQnXqMKWMd4k6NgKhet6oDXotQFm93zYjYwu7bMH2OXLFOgfAJyPfDKo9FJBA53AFqRS7TPXgRZMPpHjEjeO4bzu/7Id4pWqAj4pqMu1Q2iE+fe50uJOM7iqJkbI2dWae4FSB5yWI3rat+SHIwbDovwIDAQAB";

    /**
     * 私钥解密
     *
     * @param privateKeyString 私钥
     * @param text 待解密的文本
     * @return 解密后的文本
     */
    public static String decryptByPrivateKey(String text) throws Exception
    {
        return decryptByPrivateKey(myPrivateKey, text);
    }

    /**
     * 私钥加密
     *
     * @param privateKeyString 私钥
     * @param text 代加密的文本
     * @return 解密后的文本
     */
    public static String encryptByPrivateKey(String text) throws Exception
    {
        String s = encryptByPrivateKey(publicKey, text);
        return s;
    }
    /**
     * 公钥加密
     *
     * @param publicKey 公钥
     * @param text 代加密的文本
     * @return 解密后的文本
     */
    public static String encryptByPublicKey(String text) throws Exception
    {
        return encryptByPublicKey(myPublicKey, text);
    }
    /**
     * 公钥解密
     *
     * @param publicKeyString 公钥
     * @param text 待解密的信息
     * @return 解密后的文本
     */
    public static String decryptByPublicKey(String publicKeyString, String text) throws Exception
    {
        X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(publicKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, publicKey);
        byte[] result = cipher.doFinal(Base64.decodeBase64(text));
        return new String(result);
    }

    /**
     * 私钥加密
     *
     * @param privateKeyString 私钥
     * @param text 待加密的信息
     * @return 加密后的文本
     */
    public static String encryptByPrivateKey(String privateKeyString, String text) throws Exception
    {
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, privateKey);
        byte[] result = cipher.doFinal(text.getBytes());
        return Base64.encodeBase64String(result);
    }

    /**
     * 私钥解密
     *
     * @param privateKeyString 私钥
     * @param text 待解密的文本
     * @return 解密后的文本
     */
    public static String decryptByPrivateKey(String privateKeyString, String text) throws Exception
    {
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec5 = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec5);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] result = cipher.doFinal(Base64.decodeBase64(text));
        return new String(result);
    }

    /**
     * 公钥加密
     *
     * @param publicKeyString 公钥
     * @param text 待加密的文本
     * @return 加密后的文本
     */
    public static String encryptByPublicKey(String publicKeyString, String text) throws Exception
    {
        X509EncodedKeySpec x509EncodedKeySpec2 = new X509EncodedKeySpec(Base64.decodeBase64(publicKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec2);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] result = cipher.doFinal(text.getBytes());
        return Base64.encodeBase64String(result);
    }

//    public static void main(String[] args) throws NoSuchAlgorithmException {
//        RsaKeyPair rsaKeyPair = generateKeyPair();
//        System.out.println(rsaKeyPair);
//    }
    /**
     * 构建RSA密钥对
     *
     * @return 生成后的公私钥信息
     */
    public static RsaKeyPair generateKeyPair() throws NoSuchAlgorithmException
    {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(1024);
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        RSAPublicKey rsaPublicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) keyPair.getPrivate();
        String publicKeyString = Base64.encodeBase64String(rsaPublicKey.getEncoded());
        String privateKeyString = Base64.encodeBase64String(rsaPrivateKey.getEncoded());
        return new RsaKeyPair(publicKeyString, privateKeyString);
    }

    /**
     * RSA密钥对对象
     */
    public static class RsaKeyPair
    {
        private final String publicKey;
        private final String privateKey;

        public RsaKeyPair(String publicKey, String privateKey)
        {
            this.publicKey = publicKey;
            this.privateKey = privateKey;
        }

        public String getPublicKey()
        {
            return publicKey;
        }

        public String getPrivateKey()
        {
            return privateKey;
        }
    }
}
