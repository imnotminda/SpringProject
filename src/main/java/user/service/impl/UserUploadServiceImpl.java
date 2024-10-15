package user.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import user.bean.UserUploadDTO;
import user.dao.UserUploadDAO;
import user.service.ObjectStorageService;
import user.service.UserUploadService;

@Service
public class UserUploadServiceImpl implements UserUploadService {

	@Autowired
	private UserUploadDAO userUploadDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private ObjectStorageService objectStorageService;
	
	private String bucketName = "bitcamp-9th-bucket-142";
	
	@Override
	public void upload(List<UserUploadDTO> imageUploadList) {
		userUploadDAO.upload(imageUploadList);
	}

	@Override
	public List<UserUploadDTO> uploadList() {
		return userUploadDAO.uploadList();
	}

	@Override
	public UserUploadDTO uploadView(String seq) {
		return userUploadDAO.uploadView(seq);
	}

	@Override
	public UserUploadDTO getSeq(String seq) {
		return userUploadDAO.getSeq(seq);
	}

	@Override
	public void uploadUpdate(UserUploadDTO userUploadDTO, MultipartFile img) {
		//실제폴더
		String filePath = session.getServletContext().getRealPath("resources/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		System.out.println("img = " + img);
		
		UserUploadDTO dto = userUploadDAO.getSeq(userUploadDTO.getSeq()+""); //1개의 정보를 들고옴
		String imageFileName;
		
		if(img.getSize() != 0) {
			//Object Storate(NCP)는 이미지를 덮어쓰기 않는다.
			//DB에서 seq에 해당하는 imageFileName을 꺼내와서 Object Storate(NCP)의 이미지를 삭제하고,
			//새로운 이미지를 올린다.
			imageFileName = dto.getImageFileName();
			System.out.println("imageFileName = " + imageFileName);
			
			//Object Storate(NCP)는 이미지 삭제
			objectStorageService.deleteFile(bucketName, "storage/", imageFileName);
			
			//Object Storate(NCP)는 새로운 이미지 올리기
			imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
		
			String imageOriginalFileName = img.getOriginalFilename();
			File file = new File(filePath, imageOriginalFileName);
			
			try {
				img.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}		
		
			userUploadDTO.setImageFileName(imageFileName);
			userUploadDTO.setImageOriginalFileName(imageOriginalFileName);
			
		} else {
			
			userUploadDTO.setImageFileName(dto.getImageFileName());
			userUploadDTO.setImageOriginalFileName(dto.getImageOriginalFileName());
		}
				
		//DB
		userUploadDAO.uploadUpdate(userUploadDTO);
}

	@Override
	public void uploadDelete(String[] check) {
		//mapper.xml에서 <forEach>를 사용하려면 데이터를 List에 담아야한다
		List<String> list = new ArrayList<>();
		
		//Object Storage 삭제
		for( String seq : check) {
			String imageFileName = userUploadDAO.getImageFileName(Integer.parseInt(seq));
			list.add(imageFileName);
		}
		
		objectStorageService.deleteFile(bucketName, "storage/", list);
		
		//DB 삭제
		userUploadDAO.uploadDelete(list);
	}




}
