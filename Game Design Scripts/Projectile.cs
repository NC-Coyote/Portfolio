using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    // public variables
    public float speed;
    public Rigidbody2D rb;
    public GameObject impactEffect;
    public GameObject playerController;
    public GameObject playerStats;

    //private variables
    private PlayerStats plyrStats;

    void Start()
    {
        // assign values to certain variables
        plyrStats = playerStats.GetComponent<PlayerStats>();
        rb.velocity = transform.right * speed;
    }

    void Update()
    {
        // destroy the projectile after 1 second has passed if it has not hit anything
        Destroy(gameObject, 1f);        
    }


    // make the enemy take damage if the projectile hits them
    void OnTriggerEnter2D(Collider2D collision)
    {
        Centipede enemy = collision.GetComponent<Centipede>();
        FlyingEnemy flyGuy = collision.GetComponent<FlyingEnemy>();
        ExplodingEnemy exploder = collision.GetComponent<ExplodingEnemy>();
        RollingEnemy roller = collision.GetComponent<RollingEnemy>();
        Spider spider = collision.GetComponent<Spider>();


        if (enemy != null)
        {
            enemy.TakeDamage(plyrStats.playerDmg);
        }
        else if (flyGuy != null)
        {
            flyGuy.TakeDamage(plyrStats.playerDmg);
        }
        else if (exploder != null)
        {
            exploder.TakeDamage(plyrStats.playerDmg);
        }
        else if (roller != null)
        {
            roller.TakeDamage(plyrStats.playerDmg);
        }
        else if (spider != null)
        {
            spider.TakeDamage(plyrStats.playerDmg);
        }

        if(!collision.gameObject.CompareTag("winning"))
        {
            Instantiate(impactEffect, transform.position, transform.rotation);
            Destroy(gameObject);
        }
    }
}
