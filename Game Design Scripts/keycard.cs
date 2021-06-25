using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class keycard : MonoBehaviour
{
    public Vector3 moveDir;
    public float moveDist;
    public float speed;

    private Vector3 startPos;

    private GameObject player;

    void Start()
    {
        startPos = gameObject.transform.position;
        player = GameObject.FindGameObjectWithTag("Player");
    }

    void Update()
    {
        transform.position = startPos + moveDir * (moveDist * Mathf.Sin(Time.time * speed));
    }

    void OnTriggerEnter2D(Collider2D collision)
    {
        player.GetComponent<PlayerStats>().keycard = true;
        player.GetComponent<PlayerStats>().keycardImage.SetActive(true);
        this.gameObject.SetActive(false);
    }
}
