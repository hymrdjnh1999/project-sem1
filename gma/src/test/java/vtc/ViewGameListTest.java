// package vtc;

// import static org.junit.Assert.assertTrue;

// import java.util.List;

// import org.junit.Test;

// import vtc.bl.GameBL;
// import vtc.persistances.Game;
// import vtc.ui.game.GameHelper;

// public class ViewGameListTest {
// @Test
// public void ViewGameListTC1() {
// String expected = "input is not one in options!";
// List<Game> gameList = new GameBL().getGameList(0);
// GameHelper GameHelper = new GameHelper(0, gameList);
// try {
// GameHelper.checkInputIsGameIndex("invalid input");
// } catch (Exception e) {
// assertTrue("true input",
// e.getMessage().toString().equalsIgnoreCase(expected));
// }
// }

// @Test
// public void ViewGameListTC2() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.firstPage("");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("empty input"));
// }
// }

// @Test
// public void ViewGameListTC3() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.midPage("");

// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("empty input"));
// }
// }

// @Test
// public void ViewGameListTC4() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.lastPage("");

// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("empty input"));
// }
// }

// @Test
// public void ViewGameListTC5() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.firstPage("n");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is next!"));
// }
// }

// @Test
// public void ViewGameListTC6() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.midPage("n");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is next!"));
// }
// }

// @Test
// public void ViewGameListTC7() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.firstPage("q");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is back!"));
// }
// }

// @Test
// public void ViewGameListTC8() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.midPage("q");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is back!"));
// }
// }

// @Test
// public void ViewGameListTC9() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.lastPage("q");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is back!"));
// }
// }

// @Test
// public void ViewGameListTC10() {
// String expected = "input is back to previousPage!";
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.midPage("p");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase(expected));
// }
// }

// @Test
// public void ViewGameListTC11() {
// String expected = "input is back to previousPage!";
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.lastPage("p");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase(expected));
// }
// }

// @Test
// public void ViewGameListTC12() {
// String Expected = "Game index not found!";
// List<Game> gameList = new GameBL().getGameList(0);
// GameHelper GameHelper = new GameHelper(0, gameList);
// try {
// GameHelper.checkInputIsGameIndex("7");
// } catch (Exception e) {
// assertTrue("true input",
// e.getMessage().toString().equalsIgnoreCase(Expected));
// }
// }

// @Test
// public void ViewGameListTC13() {
// String Expected = "Game index not found!";
// List<Game> gameList = new GameBL().getGameList(0);
// GameHelper GameHelper = new GameHelper(0, gameList);
// try {
// GameHelper.checkInputIsGameIndex("0");
// } catch (Exception e) {
// assertTrue("true input",
// e.getMessage().toString().equalsIgnoreCase(Expected));
// }
// }

// @Test
// public void ViewGameListTC14() {
// String Expected = "input is game index";
// List<Game> gameList = new GameBL().getGameList(10);
// GameHelper GameHelper = new GameHelper(10, gameList);
// try {
// GameHelper.checkInputIsGameIndex("15");
// } catch (Exception e) {
// assertTrue("true input",
// e.getMessage().toString().equalsIgnoreCase(Expected));
// }
// }

// }