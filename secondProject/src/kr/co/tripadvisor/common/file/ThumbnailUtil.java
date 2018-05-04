package kr.co.tripadvisor.common.file;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class ThumbnailUtil {
	/*
	 *    @param oriPath : 썸네일을 생성할 원본 이미지
	 *    @param targetPath : 썸네일의 이름 및 저장할 경로 지정
	 *    @param newWidth : 생성하려는 썸네일의 너비
	 *    @param newHeight : 생성하려는 썸네일의 높이
	 *    @param type : 생성할 썸네일의 비율 기준(W: 너비 기준, H: 높이 기준, X: 비율무시)
	 */
	
	public static void createThumbnail(String oriPath, String targetPath, int newWidth, int newHeight, String type) {
 
		String format = "jpg";
		
		try {
			int thumbWidth = 0;
			int thumbHeight = 0;
			
			Image image = ImageIO.read(new File(oriPath));
			int oriWidth = image.getWidth(null); //이미지가 원래 가지고 있던 너비와 높이
			int oriHeight = image.getHeight(null);
			
			double ratio = 0; //비율값
			switch (type) {
			case "W" : 
				ratio = (double) newWidth / oriWidth;
				thumbWidth = (int)(ratio * oriWidth);
				thumbHeight = (int)(ratio * oriHeight);
				break;
			case "H" : 
				ratio = (double) newHeight / oriHeight;
				thumbWidth = (int)(ratio * oriWidth);
				thumbHeight = (int)(ratio * oriHeight);
				break;
			default :
				thumbWidth = newWidth;
				thumbHeight = newHeight;
				break;
			}
			
			System.out.println(oriWidth + "-" + oriHeight);
			System.out.println(thumbWidth + "-" + thumbHeight);
	 
			Image reImage = image.getScaledInstance(thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
			
			BufferedImage bImage = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_INT_RGB);
 
			Graphics g = bImage.getGraphics();
			g.drawImage(reImage, 0, 0, null);
			g.dispose();
 
			ImageIO.write(bImage, format, new File(targetPath));
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
