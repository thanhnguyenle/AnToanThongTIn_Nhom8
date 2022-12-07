package model;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;

public class VerifyDigitalSignature {
	public static void main(String[] args) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, InvalidKeySpecException, InvalidKeyException, SignatureException {
		FileInputStream keyfis = new FileInputStream("E:\\ForCode\\Ideal\\ATTT\\AnToanThongTin_Nhom8\\DigitalSignature\\data\\publickey.txt");
		byte[] encKey = new byte[keyfis.available()];
		keyfis.read(encKey);
		keyfis.close();
		X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(encKey);
		KeyFactory keyFactory = KeyFactory.getInstance("DSA", "SUN");
		PublicKey pubKey = keyFactory.generatePublic(pubKeySpec);
		/* input the signature bytes */
		FileInputStream sigfis = new FileInputStream("E:\\ForCode\\Ideal\\ATTT\\AnToanThongTin_Nhom8\\DigitalSignature\\data\\signature.txt");
		byte[] sigToVerify = new byte[sigfis.available()];
		sigfis.read(sigToVerify);
		sigfis.close();
		/* create a Signature object and initialize it with the public key */
		Signature sig = Signature.getInstance("SHA1withDSA", "SUN");
		sig.initVerify(pubKey);
		/* Update and verify the data */
		FileInputStream datafis = new FileInputStream("E:\\ForCode\\Ideal\\ATTT\\AnToanThongTin_Nhom8\\DigitalSignature\\data\\digital.txt");
		BufferedInputStream bufin = new BufferedInputStream(datafis);
		byte[] buffer = new byte[1024];
		int len;
		while (bufin.available() != 0) {
			len = bufin.read(buffer);
			sig.update(buffer, 0, len);
		}
		;
		bufin.close();
		boolean verifies = sig.verify(sigToVerify);
		System.out.println("signature verifies: " + verifies);
	}
}
