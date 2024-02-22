import random

from typing import List


class Vector:
    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y


class Rectangle:
    def __init__(self, px: float, py: float, sx: float, sy: float, vx: float, vy: float):
        self.size = Vector(sx, sy)
        self.position = Vector(px, py)
        self.velocity = Vector(vx, vy)

class Collision:
    def __init__(self, t: float, x: float, y: float, nx: float, ny: float):
        self.time = t
        self.point = Vector(x, y)
        self.normal = Vector(nx, ny)

def ray_rectangle_collision(origin: Vector, direction: Vector, target: Rectangle) -> Collision:
    t_near = Vector(
        (
            (target.position.x - origin.x) / direction.x
            if direction.x != 0
            else (float("inf") if (target.position.x - origin.x) > 0 else float("-inf"))
        ),
        (
            (target.position.y - origin.y) / direction.y
            if direction.y != 0
            else (float("inf") if (target.position.y - origin.y) > 0 else float("-inf"))
        ),
    )
    t_far = Vector(
        (
            (target.position.x + target.size.x - origin.x) / direction.x
            if direction.x != 0
            else (float("inf") if (target.position.x + target.size.x - origin.x) > 0 else float("-inf"))
        ),
        (
            (target.position.y + target.size.y - origin.y) / direction.y
            if direction.y != 0
            else (float("inf") if (target.position.y + target.size.y - origin.y) > 0 else float("-inf"))
        ),
    )

    if t_near.x > t_far.x:
        t_near.x, t_far.x = t_far.x, t_near.x
    if t_near.y > t_far.y:
        t_near.y, t_far.y = t_far.y, t_near.y

    collision = Collision(-1, 0, 0, 0, 0)

    if t_near.x > t_far.y or t_near.y > t_far.x:
        return collision

    t_hit_near = max(t_near.x, t_near.y)
    t_hit_far = min(t_far.x, t_far.y)

    if t_hit_far < 0:
        return collision

    collision.time = t_hit_near
    collision.point.x = origin.x + t_hit_near * direction.x
    collision.point.y = origin.y + t_hit_near * direction.y

    if t_near.x > t_near.y:
        if direction.x < 0:
            collision.normal.x = 1
            collision.normal.y = 0
        else:
            collision.normal.x = -1
            collision.normal.y = 0
    elif t_near.x < t_near.y:
        if direction.y < 0:
            collision.normal.x = 0
            collision.normal.y = 1
        else:
            collision.normal.x = 0
            collision.normal.y = -1

    return collision


def aabb_continuous_resolve(r1: Rectangle, collision: Collision) -> None:
    return Vector(
        r1.velocity.x + collision.normal.x * abs(r1.velocity.x) * (1 - collision.time),
        r1.velocity.y + collision.normal.y * abs(r1.velocity.y) * (1 - collision.time),
    )


def aabb_continuous_detection(r1: Rectangle, r2: Rectangle, dt: float) -> Collision:
    if r1.velocity.x == 0 and r1.velocity.y == 0:
        return Collision(-1, 0, 0, 0, 0)

    r2_expanded = Rectangle(
        r2.position.x - r1.size.x / 2,
        r2.position.y - r1.size.y / 2,
        r2.size.x + r1.size.x,
        r2.size.y + r1.size.y,
        0,
        0,
    )
    collision = ray_rectangle_collision(
        Vector(r1.position.x + r1.size.x / 2, r1.position.y + r1.size.y / 2),
        Vector(r1.velocity.x * dt, r1.velocity.y * dt),
        r2_expanded,
    )

    return collision
