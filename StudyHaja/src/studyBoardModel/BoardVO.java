package studyBoardModel;
import java.io.Serializable;
import java.sql.Timestamp;
												//네트워크에서 데이터는 바이트 단위로 전송이 된다.
												// 객체를 바이트 단위로 보내야한다.
												// 객체 직렬화, 객체 데이터를 바이트 단위로 분해하여 보내주는것 
public class BoardVO implements Serializable {    //model
		// 필드 선언
		private int num;			// 글번호
		private String id;		// 작성자
		private String temp_id;
		public String getTemp_id() {
			return temp_id;
		}
		public void setTemp_id(String temp_id) {
			this.temp_id = temp_id;
		}
		private String title;		// 제목
		private Timestamp reg_date;		// 글쓴 날짜
		private int readcount;		// 조회수
		private int ref;			// 그룹
		private int re_step;		// 그룹 스텝
		private int re_level;		// 그룹 레벨
		private String content;		// 글 내용
		private String path;
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public Timestamp getReg_date() {
			return reg_date;
		}
		public void setReg_date(Timestamp reg_date) {
			this.reg_date = reg_date;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
		public int getRe_step() {
			return re_step;
		}
		public void setRe_step(int re_step) {
			this.re_step = re_step;
		}
		public int getRe_level() {
			return re_level;
		}
		public void setRe_level(int re_level) {
			this.re_level = re_level;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}		
		
}