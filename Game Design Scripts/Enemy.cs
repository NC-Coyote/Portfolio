using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    public float health;
    public int exp;
    public float money;
    public GameObject playerStats;
    public winCondition winCond;


    // function allowing the enemy to recieve damage and die
    public void TakeDamage(float damage)
    {
        if(playerStats.GetComponent<PlayerStats>().ripAndTear == 1)
        {
            health -= damage * 1.5f;
        }
        else
        {
            health -= damage;
        }

        if(health <= 0)
        {
            playerStats.GetComponent<PlayerStats>().giveExperience(exp);
            
            if(playerStats.GetComponent<PlayerStats>().toYourCredit == 1)
            {
                playerStats.GetComponent<PlayerStats>().giveMoney(money * 1.2f);
            }
            else
            {
                playerStats.GetComponent<PlayerStats>().giveMoney(money);
            }

            winCond.enemiesLeft--;
            Destroy(gameObject);
        }
    }
}
