package kr.co.tripadvisor.common.file;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUploadRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File file) {
		String parent = file.getParent();
		String sName = file.getName();
		String ext="";
		
		int index = sName.lastIndexOf(".");
		if (index != -1) {
			ext = sName.substring(index);
		}
		
		String uName = UUID.randomUUID().toString();
		
		return new File(parent, uName + ext);
	}
}
