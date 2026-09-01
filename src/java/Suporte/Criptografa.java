/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Suporte;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author vitor
 */
public class Criptografa {

    public static String criptografa(String senha) {
        String senhaHashed = senha;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashedBytes = md.digest(senha.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            senhaHashed = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return senhaHashed;
    }
}
