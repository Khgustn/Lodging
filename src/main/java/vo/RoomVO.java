package vo;

import org.springframework.web.multipart.MultipartFile;

public class RoomVO {
	private int roomnum;
	private String ownid, roomcount, roomname, roomprice, roomcheckin, roomcheckout, roominfo,filename;
	private MultipartFile photo;// 파일을 업로드하는 클래스
	
	private String overlap;
	
	

	
	
	
	public String getOverlap() {
		return overlap;
	}

	public void setOverlap(String overlap) {
		this.overlap = overlap;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getRoomnum() {
		return roomnum;
	}

	public void setRoomnum(int roomnum) {
		this.roomnum = roomnum;
	}

	public String getOwnid() {
		return ownid;
	}

	public void setOwnid(String ownid) {
		this.ownid = ownid;
	}

	public String getRoomcount() {
		return roomcount;
	}

	public void setRoomcount(String roomcount) {
		this.roomcount = roomcount;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getRoomprice() {
		return roomprice;
	}

	public void setRoomprice(String roomprice) {
		this.roomprice = roomprice;
	}

	public String getRoomcheckin() {
		return roomcheckin;
	}

	public void setRoomcheckin(String roomcheckin) {
		this.roomcheckin = roomcheckin;
	}

	public String getRoomcheckout() {
		return roomcheckout;
	}

	public void setRoomcheckout(String roomcheckout) {
		this.roomcheckout = roomcheckout;
	}

	public String getRoominfo() {
		return roominfo;
	}

	public void setRoominfo(String roominfo) {
		this.roominfo = roominfo;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

}
