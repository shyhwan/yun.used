package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.Blind;

public interface BlindMap {
	List<Blind> selectBlinds();
	Blind selectBlind(Blind blind);
	void insertBlind(Blind blind);
	void updateBlind(Blind blind);
	void deleteBlind(int blindNum);
}
