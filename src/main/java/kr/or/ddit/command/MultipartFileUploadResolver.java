package kr.or.ddit.command;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.command.FileUploadResolver;
import kr.or.ddit.command.MakeFileName;
import kr.or.ddit.dto.AttachVO;

public class MultipartFileUploadResolver extends FileUploadResolver {
	
	public static List<AttachVO> fileUpload(List<MultipartFile> multiFiles, String savePath) throws Exception {
		
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		// 저장 -> attachVO -> list.add
		if(multiFiles != null) {
			int fileseqNo = 1;
			for(MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath, fileName);
				
				target.mkdirs();
				
				multi.transferTo(target);
				
				AttachVO attach = new AttachVO();
				attach.setUploadpath(savePath);
				attach.setFilename(fileName);
				attach.setFiletype(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());
				attach.setFileseqNo(fileseqNo);
				attachList.add(attach);
				fileseqNo++;
			}
		}
		return attachList;
	}
}
