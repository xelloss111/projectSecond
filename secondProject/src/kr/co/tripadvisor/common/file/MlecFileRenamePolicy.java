package kr.co.tripadvisor.common.file;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MlecFileRenamePolicy implements FileRenamePolicy {
	
	public static void main(String[] args) {
		File f = new File("D:\\summernote");
		// f.getParent(); - c:/java-lec/upload
		// f.getName() - test.txt
		
		// c:/java-lec/upload/test.txt
		// c:/java-lec/upload/alkjcvoieno224vcew.txt
		
	}
	
	@Override
	public File rename(File file) {
		String parent = file.getParent();
		String name = file.getName();
		String ext = "";
		
 		int index = name.lastIndexOf(".");
 		
		if (index != -1) {
			ext = name.substring(index);
		}
		
		String uName = UUID.randomUUID().toString();
		return new File(parent, uName + ext);
	}
}	








