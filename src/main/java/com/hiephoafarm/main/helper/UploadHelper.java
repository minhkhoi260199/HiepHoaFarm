package com.hiephoafarm.main.helper;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public class UploadHelper {
//	public static String saveImage(ServletContext servletContext, MultipartFile[] files) {
	public static boolean saveImages(MultipartFile[] files) {
		try {
//			byte[] bytes = multipartFile.getBytes();
//			Path path = Paths
//					.get(servletContext.getRealPath("/uploads/images/" + multipartFile.getOriginalFilename()));
//			Files.write(path, bytes);
//			return multipartFile.getOriginalFilename();

			if (files.length == 0) {
//				return "Looks like there are no files uploaded";
				return false;
			}
			for (MultipartFile file : files) {
				byte[] bytes = file.getBytes();
//				Path path = Paths.get(servletContext.getRealPath("/uploads/images/" + file.getOriginalFilename()));
				Path path = Paths.get("src/main/webapp/static/uploads/images/" + file.getOriginalFilename());
				Files.write(path, bytes);
			}
			return true;
		} catch (IOException e) {
			return false;
		}
	}
}
