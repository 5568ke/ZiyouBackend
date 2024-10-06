"""Add many-to-many relationship between Problem and Keyword

Revision ID: 5b40f58bd2ec
Revises: e3548accdb8d
Create Date: 2024-10-03 23:49:10.587723

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '5b40f58bd2ec'
down_revision: Union[str, None] = 'e3548accdb8d'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('problem_keyword_table',
    sa.Column('problem_id', sa.Integer(), nullable=False),
    sa.Column('keyword_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['keyword_id'], ['keywords_table.id'], ),
    sa.ForeignKeyConstraint(['problem_id'], ['problems_table.id'], ),
    sa.PrimaryKeyConstraint('problem_id', 'keyword_id')
    )
    op.drop_constraint('keywords_table_problem_id_fkey', 'keywords_table', type_='foreignkey')
    op.drop_column('keywords_table', 'problem_id')
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('keywords_table', sa.Column('problem_id', sa.INTEGER(), autoincrement=False, nullable=True))
    op.create_foreign_key('keywords_table_problem_id_fkey', 'keywords_table', 'problems_table', ['problem_id'], ['id'])
    op.drop_table('problem_keyword_table')
    # ### end Alembic commands ###