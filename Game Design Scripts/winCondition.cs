using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;

public class winCondition : MonoBehaviour
{
    public PlayerStats playerStats;
    public GameObject[] uiElementsToHide;
    public GameObject winScreen;
    public bool victory = false;

    public FlyingSpawner airEnemy;
    public centipedeSpawner groundEnemy;
    public ExplodingEnemySpawner explEnemy;
    public RollingEnemySpawner rollEnemy;
    public SpiderSpawner spiderEnemy;
    public int enemiesLeft;

    public TMP_Text level;
    public TMP_Text score;
    private float playerScore;
    public TMP_Text moneyCount;
    public TMP_Text remainingEnemies;

    public GameObject objNeutralize;
    public GameObject objGoToExit;

    void Start()
    {
        enemiesLeft = airEnemy.maxEnemyCount + groundEnemy.maxEnemyCount + explEnemy.maxEnemyCount + rollEnemy.maxEnemyCount + spiderEnemy.maxEnemyCount;
        remainingEnemies.text = enemiesLeft.ToString();
        level.text = playerStats.gameLevel.ToString();
        winScreen.SetActive(false);
        Time.timeScale = 1;
    }

    private void Update()
    {
        remainingEnemies.text = enemiesLeft.ToString();

        if(playerStats.gameLevel > 1)
        {
            if(enemiesLeft <= 0 && playerStats.keycard)
            {
                objNeutralize.SetActive(false);
                objGoToExit.SetActive(true);
            }
        }
        else
        {
            if (enemiesLeft <= 0)
            {
                objNeutralize.SetActive(false);
                objGoToExit.SetActive(true);
            }
        }
    }

    void OnTriggerEnter2D(Collider2D collision)
    {
        if(playerStats.gameLevel > 1)
        {
            if (enemiesLeft <= 0 && collision.gameObject.CompareTag("Player") && playerStats.keycard)
            {
                for (int i = 0; i < uiElementsToHide.Length; i++)
                {
                    uiElementsToHide[i].SetActive(false);
                }
                victory = true;
                winScreen.SetActive(true);
                moneyCount.text = playerStats.playerMoney.ToString();
                playerScore += ((airEnemy.maxEnemyCount + groundEnemy.maxEnemyCount + explEnemy.maxEnemyCount + rollEnemy.maxEnemyCount + spiderEnemy.maxEnemyCount) + (playerStats.playerMoney * 0.5f));
                score.text = playerScore.ToString();
                Time.timeScale = 0;
            }
            else
            {
                victory = false;
            }
        }
        else
        {
            if (enemiesLeft <= 0 && collision.gameObject.CompareTag("Player"))
            {
                for (int i = 0; i < uiElementsToHide.Length; i++)
                {
                    uiElementsToHide[i].SetActive(false);
                }
                victory = true;
                winScreen.SetActive(true);
                moneyCount.text = playerStats.playerMoney.ToString();
                playerScore += ((airEnemy.maxEnemyCount + groundEnemy.maxEnemyCount + explEnemy.maxEnemyCount + rollEnemy.maxEnemyCount + spiderEnemy.maxEnemyCount) + (playerStats.playerMoney * 0.5f));
                score.text = playerScore.ToString();
                Time.timeScale = 0;
            }
            else
            {
                victory = false;
            }
        }
    }

    public void NextLevel()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
    }

    public void MainMenu()
    {
        SceneManager.LoadScene("Menu");
    }

    public void Restart()
    {
        playerStats.playerHealth = playerStats.playerMaxHealth;
        PlayerPrefs.SetFloat("playerHealth", playerStats.playerHealth);
        playerStats.playerExp = 0;
        PlayerPrefs.SetInt("playerExp", playerStats.playerExp);
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }

    public void QuitGame()
    {
        Application.Quit();
    }
}
