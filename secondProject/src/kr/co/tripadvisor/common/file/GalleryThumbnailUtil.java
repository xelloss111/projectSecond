package kr.co.tripadvisor.common.file;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class GalleryThumbnailUtil {
	public void createThumbnail(String datePath, String sysname) {
		//filename = datePath + / + sysname;
		try { 
			File originalFileNm = new File("c:/java-lec/workspace/mini2_web1/secondProject/WebContent/galleryImg" + datePath + "/" + sysname); 
			File thumbnailFileNm = new File("c:/java-lec/workspace/mini2_web1/secondProject/WebContent/thumb/"+ sysname); 
			int width = 330; 
			int height = 200;
			BufferedImage originalImg = ImageIO.read(originalFileNm); 
			BufferedImage thumbnailImg = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D g = thumbnailImg.createGraphics(); 
			g.drawImage(originalImg, 0, 0, width, height, null);
			ImageIO.write(thumbnailImg, "jpg", thumbnailFileNm);
			System.out.println("썸네일 생성 완료");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
