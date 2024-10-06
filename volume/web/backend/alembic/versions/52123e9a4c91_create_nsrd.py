"""create_nsrd

Revision ID: 52123e9a4c91
Revises: 9b558c714c32
Create Date: 2024-02-06 17:45:13.111467

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '52123e9a4c91'
down_revision: Union[str, None] = '9b558c714c32'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    pass


def downgrade() -> None:
    pass
