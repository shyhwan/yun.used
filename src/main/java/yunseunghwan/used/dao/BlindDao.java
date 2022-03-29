package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Blind;

public interface BlindDao {
	List<Blind> selectBlinds();
	Blind selectBlind(Blind blind);
	void insertBlind(Blind blind);
	void updateBlind(Blind blind);
	void deleteBlind(int blindNum);
}
