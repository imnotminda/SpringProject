package user.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import user.bean.UserUploadDTO;

public interface UserUploadService {

	public void upload(List<UserUploadDTO> imageUploadList);

	public List<UserUploadDTO> uploadList();

	public UserUploadDTO uploadView(String seq);

	public UserUploadDTO getSeq(String seq);

	public void uploadUpdate(UserUploadDTO userUploadDTO, MultipartFile img);

	public void uploadDelete(String[] check);


}
