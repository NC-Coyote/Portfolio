using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class dropDead : MonoBehaviour
{
    public PlayerStats playerStats;

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if(collision.gameObject.CompareTag("Player"))
        {
            playerStats.loseMenuScreen = true;
            Time.timeScale = 0;
            playerStats.loseScreen.SetActive(true);
            playerStats.playerHealth = playerStats.playerMaxHealth;
            PlayerPrefs.SetFloat("playerHealth", playerStats.playerHealth);
            playerStats.playerExp = 0;
            PlayerPrefs.SetInt("playerExp", playerStats.playerExp);
        }
    }
}
