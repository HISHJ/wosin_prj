package kr.co.sist.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import kr.co.sist.dao.AdminDAO;
import kr.co.sist.util.cipher.DataDecrypt;
import kr.co.sist.util.cipher.DataEncrypt;
import kr.co.sist.vo.AdminVO;


public class DbAdminService {

	public static String getText() throws IOException {
		String plainText = "";
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(new File("C://Users//user//Desktop/DBCP.txt/"));

			// 파일의 내용을 byte단위로 읽어옴
			// 읽어서 저장할 버퍼 byte배열 설정
			byte[] byteBuff = new byte[9999];
			// 파일을 읽고 읽은 크기를 저장
			int nLen = fis.read(byteBuff);
			// 문자열 변환
			plainText = new String(byteBuff, 0, nLen);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("파일이 없습니다.");
		} finally {
			fis.close();
		}
		return plainText;
	}

	// 아이디,비번 넣기(암호화)
	public void addAdminInfo() throws IOException, GeneralSecurityException {
		String plainText = "xO4uy3dsdAt1S1iSOJMYAQ==";
		MessageDigest md;
		String[] infoArr = { "team2", "rkwkal~!11" };

		// 유효성검증 생략
		// 아이디 암호화
		// 1. 알고리즘을 설정하여 MessageDigest객체얻음
		//try {
			md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			new String(md.digest());
			String key = DataEncrypt.messageDigest("MD5", plainText);
			//System.out.println(key);// xO4uy3dsdAt1S1iSOJMYAQ==
			// 1. 키를 넣어 암호화 객체 생성
			DataEncrypt de = new DataEncrypt(key);

			// 아이디 암호화
			String adminId = de.encryption(infoArr[0]);

			// 아이디 복호화 DataDecrypt
			DataDecrypt dd = new DataDecrypt(key);
			String plainId = dd.decryption(adminId);
			System.out.println("아이디복호화" + plainId);// team2

			// 비번 암호화
			String adminPass = DataEncrypt.messageDigest("SHA-1", infoArr[1]);
			System.out.println("패스워드 암호화" + adminPass);

			AdminVO aVO = new AdminVO();
			aVO.setId(adminId);
			aVO.setPwd(adminPass);

			AdminDAO aDAO = AdminDAO.getInstance();
			try {
				aDAO.insertInfo(aVO);
				System.out.println("아이디 비밀번호가 추가되었습니다");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				// OracleException상황 비교
			}
		
	}// addAdminInfo()

	public static void main(String[] args) throws GeneralSecurityException {
		DbAdminService dba = new DbAdminService();
		try {
			dba.addAdminInfo();
			//String plain = dba.getText();
			//System.out.println(plain);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // end catch
	}// main
}// class
